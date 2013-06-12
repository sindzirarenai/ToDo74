


<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.Task>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



<script src="../../Scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.ui.datepicker.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.ui.core.min.js" type="text/javascript"></script>

    <h2>New task</h2>

    <% using (Html.BeginForm()) {%>

    <%: Html.ValidationSummary(true,"Error in create. Please fill the fields correct") %>

        <h3>Please fill the next fields</h3>
        <fieldset>
            <legend>Fields</legend>                
                <p>Header*</p>
                <%: Html.TextBoxFor(model => model.header) %>
                <%: Html.ValidationMessageFor(model => model.header) %>

                <p>About task*</p>         
                <%: Html.TextAreaFor(model => model.text, new {@Rows="4",cols="22" })%>
                <%: Html.ValidationMessageFor(model => model.text) %>
              
                <p>Date by plan*</p>
                <%: Html.TextBoxFor(model => model.date_plan, new {@class="datePicker"})%> 
                <%: Html.ValidationMessageFor(model => model.date_plan) %>
                  
            <p></p>
            <p>
                <input type="submit" value="Create" />

            </p>
        </fieldset>
        <p><%: Html.ActionLink("Cancel", "Index", new { id = 0,done = false })%></p>
 <% } %>

 <script type="text/javascript">
     $(document).ready(function () {
         $('#date_plan').datepicker({ firstDay: 1, dateFormat: 'dd.mm.yy' });
         $('.datePicker').datepicker({ firstDay: 1, dateFormat: 'dd.mm.yy' });
     });
</script>


</asp:Content>

