<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ToDo.Models.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                user_id
            </th>
            <th>
                name
            </th>
            <th>
                email
            </th>
            <th>
                password
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.user_id }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.user_id })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.user_id })%>
 
                <%: Html.ActionLink("View Task","Index","Task", new {id=item.user_id,done=false},null)%>
            </td>
            <td>
                <%: item.user_id %>
            </td>
            <td>
                <%: item.name %>
            </td>
            <td>
                <%: item.email %>
            </td>
            <td>
                <%: item.password %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create")%>
        <%: Html.ActionLink("Log on","LogOn") %>
    </p>

</asp:Content>

