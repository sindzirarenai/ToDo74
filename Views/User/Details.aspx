<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        Name:  <%: Model.name %> 
        </p>
        Email: <%: Model.email %> 
        
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

