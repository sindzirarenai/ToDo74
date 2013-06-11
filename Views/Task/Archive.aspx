<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ToDo.Models.Task>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Archive
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Archive</h2>

    <table>
        <tr>
         
            <th>
                Header
            </th>
            <th>
                Date by plan
            </th>

            <th> Actions </th>
        </tr>

    <% foreach (var item in Model) { %>
        
           <tr style = "background-color:Lime">

            <td>
                <%: item.header %>
            </td>
            <td>
                <%: String.Format("{0:dd.MM.yyyy}",item.date_plan) %>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.task_id }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.task_id })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.task_id })%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Back", "Index", new { id = 0, done=false})%>
    </p>

</asp:Content>
