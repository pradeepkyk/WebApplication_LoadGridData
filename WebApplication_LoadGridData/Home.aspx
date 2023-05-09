<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication_LoadGridData.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Hero section -->
    <section id="hero-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <h1>Welcome to My Site</h1>
            <p>Tagline or a brief description goes here</p>
            <a href="#" class="btn btn-primary btn-lg">Learn More</a>
          </div>
          <div class="col-lg-6">
            <img src="Images/original-ec7178fb71cebaad698a98dd23653f6f.jpeg" class="img-fluid" alt="Hero image">
          </div>
        </div>
      </div>
    </section>

    <!-- Features section -->
    <section id="features-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <h3>Feature 1</h3>
            <p>Description of feature 1 goes here</p>
          </div>
          <div class="col-lg-4">
            <h3>Feature 2</h3>
            <p>Description of feature 2 goes here</p>
          </div>
          <div class="col-lg-4">
            <h3>Feature 3</h3>
            <p>Description of feature 3 goes here</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Call to action section -->
    <section id="cta-section">
      <div class="jumbotron text-center">
        <h2>Go to Infinite Scroll Grid</h2>
        <p>Text to encourage user action goes here</p>
        <a href="AllCustomers.aspx" class="btn btn-success btn-lg">Get Started</a>
      </div>
    </section>
</asp:Content>
