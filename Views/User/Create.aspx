<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.User>" %>

<asp:Content ID="TiTleContent" ContentPlaceHolderID="TitleContent" runat="server">
	Registration
</asp:Content>

<asp:Content ID="UserContent" ContentPlaceHolderID="MainContent" runat="server">

  <h2>Registration</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true,"Error regiatration. Please fill the fields correct.") %>
        
        <fieldset>
            <legend>Fields</legend>
                   
            <div class="editor-label">
                Name
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.name) %>
                <%: Html.ValidationMessageFor(model => model.name) %>
            </div>
            
            <div class="editor-label">
                Email
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.email) %>
                <%: Html.ValidationMessageFor(model => model.email) %>
            </div>
            
            <div class="editor-label">
                Password
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(model => model.password) %>
                <%: Html.ValidationMessageFor(model => model.password) %>
            </div>

            <div class="editor-label">
                <%: Html.Label("Conform password") %>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(model => model.conformPassword) %>
                <%: Html.ValidationMessageFor(model => model.conformPassword) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Cancel", "LogOn") %>
    </div>

</asp:Content>
