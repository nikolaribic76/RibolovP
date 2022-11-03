<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ribolov._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p>Unesite podatke o ribolovcu:</p>
    <br />

     <asp:Label ID="Label1" runat="server" Text="Ime:"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
     <asp:Label ID="Label2" runat="server" Text="Prezime:"></asp:Label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <br />
     <asp:Label ID="Label3" runat="server" Text="Adresa:"></asp:Label><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <br />
     <asp:Label ID="Label4" runat="server" Text="Telefon:"></asp:Label><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <br />
    <br />
     <asp:Label ID="Label5" runat="server" Text="Grad:"></asp:Label><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    <br />
    <br />

    <asp:Button ID="Button1" runat="server" Text="Sacuvaj" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Odustani" OnClick="Button2_Click" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RibolovConnectionString %>" SelectCommand="SELECT * FROM [Grad]"></asp:SqlDataSource>

</asp:Content>
