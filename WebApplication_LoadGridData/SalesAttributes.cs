﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication_LoadGridData
{
    public class SalesAttributes
    {
        public string Region { get; set; }
        public string Country { get; set; }
        public string ItemType { get; set; }
        public string SalesChannel { get; set; }
        public string OrderPriority { get; set; }
        public string OrderDate { get; set; }
        public double OrderID { get; set; }
        public string ShipDate { get; set; }
        public double UnitsSold { get; set; }
        public double UnitPrice { get; set; }
        public double UnitCost { get; set; }
        public double TotalRevenue { get; set; }
        public double TotalCost { get; set; }
        public double TotalProfit { get; set; }
        public double TotalPages { get; set; }
        public double CurrentPage { get; set; }
    }
}