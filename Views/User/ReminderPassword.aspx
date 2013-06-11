<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ReminderPassword
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Please input your email. We will send your password.</h2>

     <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true,"Error log in. Please fill the fields correct.")%>
        <div>
            <fieldset>
                <legend>Reminder password</legend>
                
                <div class="editor-label">
                    Email
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.email) %>
                    <%: Html.ValidationMessageFor(m => m.email) %>
                </div>
                
                 <p>
                    <input type="submit" value="Send" />
                </p>
                    <%:Html.ActionLink("Cancel","LogOn") %>
            </fieldset>
        </div>
    <% } %>

</asp:Content>
