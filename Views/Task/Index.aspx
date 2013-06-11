<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ToDo.Models.Task>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	All tasks
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>My tasks</h2>

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
          <% string style = "background-color:#abcdef";
           if (DateTime.Compare(item.date_plan, DateTime.Today) >= 0) {style = "background-color:#abcdef"; }
           if (DateTime.Compare(item.date_plan, DateTime.Today) < 0) { style = "background-color:#FF4500"; } %>  
        
           <tr style = <%: style %>>
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
        <%: Html.ActionLink("Create new task", "Create") %>
        <%: Html.ActionLink("Archive", "Archive", new {id = 0})%>
        <%: Html.ActionLink("Exit", "LogOff","User") %>
    </p>

</asp:Content>

