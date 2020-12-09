<%@ Page Title="X-Ray Test" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="XRay.aspx.cs" Inherits="AWSBeanstalkHelloWorldWebApp.Services.XRay" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent"></asp:Content>
<asp:Content ID="OtherContent" runat="server" ContentPlaceHolderID="OtherContent">
	<section class="congratulations">
		<h1>Congratulations!</h1>
		<p>Your AWS Elastic Beanstalk <em>ASP.NET</em> application is now running on your own dedicated environment in the AWS&nbsp;Cloud</p>
	</section>
  
	<section class="instructions">
		<h1>X-Ray Test Page</h1>
        This example uses a simple, in-memory database.
        <br /><br />
        Learn more in the <a href="https://github.com/awslabs/aws-xray-dotnet-webapp">X-Ray .NET Sample Application</a>.
<br /><br />
<div>
    <br /><br />
    <h2>Get Product by ID</h2>  
    <label>Id:</label>
    <input type="text" id="prodId" size="5"/>
    <input type="button" value="Search" onclick="find();"/>
    <p id="product"/>
</div>
<br /><br />
    <div>
        <form id="addProductForm" method="post" action="/api/products" >
            <h2>Add New Product</h2>
            <p>
                <label for="productId">Id:</label>
                <input type="number" name="Id" size="5"/>
            </p>
            <p>
                <label for="productName">Name:</label>
                <input type="text" name="Name" size="5" />
            </p>
            <p>
                <label for="productPrice">Price:</label>
                <input type="number" name="Price" size="5" />
            </p>
            <input type="button" id="addProduct" value="Add" />
            <ul id="products"></ul>
        </form>

    </div>

    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.min.js"></script>
    <script>
    var uri = '/api/products';

    function formatItem(item) {
        console.log(1);
        return item.Name + ': $' + item.Price;
    }

    function find() {
      var id = $('#prodId').val();
      $.getJSON(uri + '/' + id)
          .done(function (data) {
            $('#product').text(formatItem(data));
          })
          .fail(function (jqXHR, textStatus, err) {
            $('#product').text('Error: ' + err);
          });
    }

    $('#addProduct').click(function () {
        var data = $("#addProductForm").serialize();
        $.ajax({
            type: "POST",
            url: uri,
            data: data,
            success: function (ignored) {
                $('<li>', { text: "Saved: " + data }).appendTo($('#products'));
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error, status = " + textStatus + ", " +
                      "error thrown: " + errorThrown
                );
            }
        });
    });
    </script>


	</section>
</asp:Content>
