<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Ribolov.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RibolovConnectionString %>" SelectCommand="SELECT * FROM [Ribolovac]"></asp:SqlDataSource>
    
    <br />
    <br />

    <asp:Label ID="Label1" runat="server" Text="Redni broj pecarosa"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    <br />

    <asp:Label ID="Label2" runat="server" Text="Datum"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    
    <br />

    <asp:Label ID="Label3" runat="server" Text="Vrsta ribe"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
    
    <br />

    <asp:Label ID="Label4" runat="server" Text="Gramaza"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    
    <br />
    <br />
    <br />


    

    
    <asp:Button ID="Button1" runat="server" Text="Potvrdi" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Otkazi" />


    

    
</asp:Content>
