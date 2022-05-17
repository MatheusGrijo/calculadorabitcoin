using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public partial class calculadorabitcoin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    static double[] probability(double priceActual, double strike, double daysLeft, double vh)
    {
        try
        {
            double p = priceActual;
            double q = strike;
            double t = daysLeft / 365;
            double v = vh / 100;

            double vt = v * Math.Sqrt(t);
            double lnpq = Math.Log(q / p);
            double d1 = lnpq / vt;

            double y = Math.Floor(1 / (1 + .2316419 * Math.Abs(d1)) * 100000) / 100000;
            double z = Math.Floor(.3989423 * Math.Exp(-((d1 * d1) / 2)) * 100000) / 100000;
            double y5 = 1.330274 * Math.Pow(y, 5);
            double y4 = 1.821256 * Math.Pow(y, 4);
            double y3 = 1.781478 * Math.Pow(y, 3);
            double y2 = .356538 * Math.Pow(y, 2);
            double y1 = .3193815 * y;
            double x = 1 - z * (y5 - y4 + y3 - y2 + y1);
            x = Math.Floor(x * 100000) / 100000;

            if (d1 < 0) { x = 1 - x; }

            double pbelow = Math.Floor(x * 1000) / 10;
            double pabove = Math.Floor((1 - x) * 1000) / 10;

            double[] array = new double[2];
            array[0] = pabove; // acima de 
            array[1] = pbelow; // abaixo de
            return array;
        }
        catch (Exception ex)
        {

        }
        throw new Exception("Erro probability");
    }


    protected void cboMoeda_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtVH.Text =  getVH(cboMoeda.SelectedValue).ToString();
        txtDate.Text = DateTime.Now.AddDays(30).ToString("dd/MM/yyyy");
    }



    double getVH(string pair)
    {
        try
        {
            pair = pair.ToUpper().Replace("BTC", "XBT") + "USD";
            int amostragem = 31;
            String json = get("https://www.bitmex.com/api/v1/trade/bucketed?symbol=" + pair + "&count=" + amostragem + "&reverse=True&partial=False&binSize=1d");
            JContainer j = (JContainer)JsonConvert.DeserializeObject(json, (typeof(JContainer)));
            double preco = 0;
            double diff = 0;
            for (int i = 0; i < amostragem - 1; i++)
            {
                diff += (double.Parse(j[i]["close"].ToString().Replace(".", ",")) - double.Parse(j[i + 1]["close"].ToString().Replace(".", ","))) / double.Parse(j[i + 1]["close"].ToString().Replace(".", ","));
            }

            double media = diff / amostragem;

            for (int i = 0; i < amostragem - 1; i++)
            {
                preco += Math.Pow((double.Parse(j[i]["close"].ToString().Replace(".", ",")) - double.Parse(j[i + 1]["close"].ToString().Replace(".", ","))) / double.Parse(j[i + 1]["close"].ToString().Replace(".", ",")) - media, 2);
            }
            double variancia = preco / (amostragem - 1);
            double desvioPadrao = Math.Sqrt(variancia);

            txtPrice.Text = j[0]["close"].ToString().Replace(".", ",");

            return (desvioPadrao * 100) * Math.Sqrt(365);

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + ex.StackTrace);
        }
        return 0;
    }

    string get(String url)
    {
        try
        {
            String r = "";
            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(new Uri(url));
            httpWebRequest.Method = "GET";
            HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            Stream responseStream = httpWebResponse.GetResponseStream();
            if (responseStream != null)
            {
                StreamReader streamReader = new StreamReader(responseStream);
                r = streamReader.ReadToEnd();
            }
            if (responseStream != null) responseStream.Close();
            return r;
        }
        catch (WebException ex)
        {
            return null;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime date = DateTime.Now;
            TimeSpan ts = DateTime.Parse(txtDate.Text) - date;


            double[] arrayResult = probability(double.Parse(txtPrice.Text), double.Parse(txtStrike.Text), ts.TotalDays, double.Parse(txtVH.Text));

            lblResultado.Text = "A probabilidade do preço do "+cboMoeda.SelectedValue+"<br/>";

            lblResultado.Text += "- Estar ACIMA(<b>MAIOR</b>) de <b>$"+txtStrike.Text+"</b> é de: <b>"+arrayResult[0]+"%</b><br/>";
            lblResultado.Text += "- Estar ABAIXO(<b>MENOR</b>) de <b>$"+txtStrike.Text+"</b> é de: <b>"+arrayResult[1]+"%</b><br/>";

        }
        catch (Exception ex)
        {
            lblResultado.Text = "Erro por favor verifique os campos!";
        }
    }
}