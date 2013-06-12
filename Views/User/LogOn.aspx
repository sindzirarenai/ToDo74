<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Log in
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <h2>Log in</h2>
     <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true,"Error log in. Please fill the fields correct.")%>
        <div>
            <fieldset>
                <legend>Account</legend>
                
                <div class="editor-label">
                    Email
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.email) %>
                    <%: Html.ValidationMessageFor(m => m.email) %>
                </div>
                
                <div class="editor-label">
                    Password
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.password) %>
                </div>
                
                <%: Html.CheckBoxFor(m=>m.remember)%>  Remember me

               <p>
                    <input type="submit" value="Log in" />

                </p>
                    <%:Html.ActionLink("Registration", "Create")%>
                    <%:Html.ActionLink("Forgot password?", "ReminderPassword") %>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
