<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ToDo.Models.Task>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

 <script src="../../Scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.ui.datepicker.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.ui.core.min.js" type="text/javascript"></script>

    <% using (Html.BeginForm()) {%>

        <%: Html.ValidationSummary(true, "Error in edit. Please fill the fields correct")%>
        
        <fieldset>
            <legend>Fields</legend>
               
                <p>Header</p>
                <%: Html.TextBoxFor(model => model.header) %>
                <%: Html.ValidationMessageFor(model => model.header) %>

                <p>About task</p>        
                <%: Html.TextAreaFor(model => model.text, new {@Rows="4",cols="22" })%>
                <%: Html.ValidationMessageFor(model => model.text) %>

                <p>Date by plan</p>
                <%: Html.TextBox("date_plan", String.Format("{0:dd.MM.yyyy}", Model.date_plan))%> 
                <%: Html.ValidationMessageFor(model => model.date_plan) %>
                
                <p></p>
                Done
                <%: Html.CheckBox("done",Model.done) %> 

                <p></p>
                <p>
                    <input type="submit" value="Save" />
                    <p><%: Html.ActionLink("Cancel", "Index", new {id=Model.user,done=Model.done})%></p>
                </p>

        </fieldset>

    <% } %>
           
<script type="text/javascript">
       $(document).ready(function () {
           $('#date_plan').datepicker({ firstDay: 1, dateFormat: 'dd.mm.yy' });
           $('.datePicker').datepicker({ firstDay: 1, dateFormat: 'dd.mm.yy' });
       });
</script>

</asp:Content>

