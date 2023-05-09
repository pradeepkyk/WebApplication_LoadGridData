<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AllCustomers.aspx.cs" Inherits="WebApplication_LoadGridData.AllCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
        <style>
        .grid-container {
            margin-top: 20px;
        }

        .table-responsive {
            max-height: 100%;
            overflow-y: scroll;
        }

        .loading-spinner {
            margin-top: 10px;
            display: none;
        }
       

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <h2>My Sales Records Table</h2>
   <div class="container">
  <div class="row">
    <div class="col-md-12">
      <div id="grid-container" class="grid-container">
        <div class="table-responsive">
          <table id="grid" class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>Region</th>
                <th>Country</th>
                <th>ItemType</th>
                <th>SalesChannel</th>
                <th>OrderPriority</th>
                <th>OrderDate</th>
                <th>OrderID</th>
                <th>ShipDate</th>
                <th>UnitsSold</th>
                <th>UnitPrice</th>
                <th>UnitCost</th>
                <th>TotalRevenue</th>
                <th>TotalCost</th>
                <th>TotalProfit</th>
              </tr>
            </thead>
            <tbody id="grid-body">
              <script id="grid-template" type="text/template">
                {{#salesRecords}}
                <tr>
                  <td>{{Region}}</td>
                  <td>{{Country}}</td>
                  <td>{{ItemType}}</td>
                  <td>{{SalesChannel}}</td>
                  <td>{{OrderPriority}}</td>
                  <td>{{OrderDate}}</td>
                  <td>{{OrderID}}</td>
                  <td>{{ShipDate}}</td>
                  <td>{{UnitsSold}}</td>
                  <td>{{UnitPrice}}</td>
                  <td>{{UnitCost}}</td>
                  <td>{{TotalRevenue}}</td>
                  <td>{{TotalCost}}</td>
                  <td>{{TotalProfit}}</td>
                </tr>
                {{/salesRecords}}
              </script>
            </tbody>
          </table>
        </div>
        <div class="loading-spinner text-center">
          <div class="spinner-border text-primary" role="status">
            <span class="sr-only">Loading...</span>
          </div>
        </div>
        <div class="text-center">
          <%--<button id="load-more" class="btn btn-primary">Load More</button>--%>
        </div>
      </div>
    </div>
  </div>
</div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
            var page = 1;
            var pageSize = 10;
            var loading = false;

    function loadData(page) {
        loading = true;
        $('.loading-spinner').show();

        $.ajax({
            type: "POST",
            url: "AllCustomers.aspx/GetSalesRecords",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ pageNumber: page, pageSize: pageSize }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                var totalPages = 10;
                var currentPage = data.page;
                var salesRecords = JSON.parse(data);
                var template = $("#grid-template").html();
                Mustache.parse(template);
                var rendered = Mustache.render(template, { salesRecords: salesRecords });
                if (currentPage === 1) {
                    $('#grid').html(rendered);
                } else {
                    $('#grid').append(rendered);
                }
                if (currentPage === totalPages) {
                    $('#load-more').hide();
                } else {
                    $('#load-more').show();
                }
                loading = false;
                $('.loading-spinner').hide();
            },
            failure: function(response) {
                alert(response.d);
                loading = false;
                $('.loading-spinner').hide();
            }
        });
    }

    // Load initial data
    loadData(page);

    // Load more data on button click
    //$('#load-more').click(function (event) {
    //             debugger;
    //            event.preventDefault();
    //    if (!loading) {
    //        page++;
    //        loadData(page);
    //    }
    //         });

     window.addEventListener('scroll', function() {
      if ((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
        // Call function to load more data
        event.preventDefault();
            if (!loading) {
                page++;
                loadData(page);
            }
      }
    });
});

      </script>

</asp:Content>
