<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="calculadorabitcoin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Calculadora BITCOIN</title>
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        Calculadora de precificação de ativos, baseado no modelo de <b>BlackScholes(OPEN SOURCE)</b><br/>
        Fonte: <a href="https://pt.wikipedia.org/wiki/Black-Scholes">https://pt.wikipedia.org/wiki/Black-Scholes</a><br />
        GITHUB: https://github.com/MatheusGrijo/calculadorabitcoin/<br/>
        <p>
            Escolha a moeda:<br/>
            <asp:DropDownList ID="cboMoeda" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboMoeda_SelectedIndexChanged">
                <asp:ListItem>SELECIONE</asp:ListItem>
                <asp:ListItem Value="BTC">BITCOIN</asp:ListItem>
                <asp:ListItem Value="ETH">ETHEREUM</asp:ListItem>
                <asp:ListItem Value="SOL">SOLANA</asp:ListItem>
                <asp:ListItem Value="DOGE">DOGECOIN</asp:ListItem>
                <asp:ListItem Value="LINK">LINK</asp:ListItem>
                <asp:ListItem Value="XRP">XRP</asp:ListItem>
                <asp:ListItem Value="ADA">ADA</asp:ListItem>
                <asp:ListItem Value="BCH">BCH</asp:ListItem>
                <asp:ListItem Value="BNB">BNB</asp:ListItem>
                <asp:ListItem Value="DOT">DOT</asp:ListItem>
                <asp:ListItem Value="EOS">EOS</asp:ListItem>
                <asp:ListItem Value="GMT">GMT</asp:ListItem>
                <asp:ListItem Value="NEAR">NEAR</asp:ListItem>
                <asp:ListItem Value="AVAX">AVAX</asp:ListItem>
                <asp:ListItem Value="LTC">LTC</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            &nbsp;Preço atual do moeda:
        <br/>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        </p>
        <p>
            Preço strike(no futuro):
        <br/>
            <asp:TextBox ID="txtStrike" runat="server"></asp:TextBox>
        </p>
        <p>
            Data do strike(data futura):
        <br/>
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
        </p>
        <p>
            Volatilidade Historica(VH)(https://pt.wikipedia.org/wiki/Volatilidade_(finan%C3%A7as)):
        <br/>
            <asp:TextBox ID="txtVH" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Calcular" />
        </p>
        <p>
            <asp:Label ID="lblResultado" runat="server"></asp:Label>
        </p>
        <p>
            <strong>No que essa calculadora pode nos ajudar? E qual a utilidade dela?</strong></p>
        <p>
            Bom esse modelo de precificação de opções é amplamente utilizado no mercado tradicional há muitos anos, ele foi criado na decadá de 70, inicialmente para precificações de opções, mas podemos utiilizar ele para algumas ideias bem legais no mercado de criptomoedas, que está cada vez mais crescente, vou dar alguma sugestões que eu utilizo para operações:</p>
        <p class="auto-style1">
            1 . Swing trades ou manutenção de posição.</p>
        <p>
            Você pode calcular por exemplo se em uma data futura(mês que vem) por exemplo o valor do BITCOIN pode cair a X mil dolarés para você tomar a decisão de desmontar ou montar uma operação a longo prazo, sendo assim perfeito para swing trades de média e longa duração. Entenda que o algoritimo preve a probabilidade do preço estar ACIMA ou ABAIXO do que você colocou, o algoritimo não é capaz de prever o peço futuro.</p>
        <p class="auto-style1">
            2 . Compra/Venda de opções na DERIBIT.</p>
        <p>
            Sinceramente esse é o que eu mais uso, com base no calculo acima eu consigo verificar o quanto de probabilidade eu tenho para não ser exercido em uma opção de venda por exemplo, e fico tranquilo para vender uma CALL ou uma PUT e ganhar o prêmio dela na DERIBIT, eu costumo vender opções que ficarão abaixo do preço do strike em pelo menos 70%~80%, é uma operação mais estrutura e baseada em estatisticas.</p>
        <p class="auto-style1">
            3 . UNISWAP v3 gerando liquidez e ganhando com taxas</p>
        <p>
            Esse é uma ótima forma de renda passiva ainda mais com a UNISWAP v3, com a calculadora eu pego um par que paga bastante taxas como USDC/WETH e calculo a probabilidade do ativo ir até certo range ou não(funcionalidade nova da uniswap v3), assim fico tranquilo com os meus ganhos, não me importanto muito com a perda impermanente. PS: Isso realmente dá muito dinheiro e oportunidades! DEFi é perfeito para isto!</p>
        <p class="auto-style1">
            4 . Especulação</p>
        <p>
            Sabe aquela pessoa que sempre pergunta, &quot;será que o bitcoin vau cair?&quot;, pois bem com essa calculadora as suas dúvidas serão respondidas.</p>
        <p>
            *Todos os dados e calculos da mesma são obtidos através da exchange BITMEX.</p>
    </form>
</body>
</html>
