<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete account?</h3>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Yes" name="Yes"/>   
            <input type="submit" value="No" name="No"/>   
        </p>
    <% } %>

</asp:Content>

