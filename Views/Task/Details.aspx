<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.Task>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        
        <div class="display-label">Header: <%: Model.header %></div>
        
        <div class="display-label">Text: <%: Model.text %></div>
        
        <div class="display-label">Date by plan: <%: String.Format("{0:dd.MM.yyyy}", Model.date_plan) %></div>

        <div class="display-label">Done: <%: Html.CheckBox("done", new {disabled="disabled", value=Model.done})%></div>
        
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.task_id }) %> |
        <%: Html.ActionLink("Back to List", "Index", new { id = Model.User1.user_id,done=Model.done })%>
    </p>

</asp:Content>

