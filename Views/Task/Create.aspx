


<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.Task>" %>




<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <h2>New task</h2>

    <% using (Html.BeginForm()) {%>

    <%: Html.ValidationSummary(true,"Error in create. Please fill the fields correct") %>

        <h3>Please fill the next fields</h3>
        <fieldset>
            <legend>Fields</legend>                
                <p>Header</p>
                <%: Html.TextBoxFor(model => model.header) %>
                <%: Html.ValidationMessageFor(model => model.header) %>

                <p>About task</p>         
                <%: Html.TextAreaFor(model => model.text, new {@Rows="4",cols="22" })%>
                <%: Html.ValidationMessageFor(model => model.text) %>
              
                <p>Date by plan</p>
                <%: Html.TextBoxFor(model=>model.date_plan)%> 
                <%: Html.ValidationMessageFor(model => model.date_plan) %>
                  
            <p></p>
            <p>
                <input type="submit" value="Create" />

            </p>
        </fieldset>
        <p><%: Html.ActionLink("Cancel", "Index", new { id = 0,done = false })%></p>
 <% } %>
</asp:Content>

