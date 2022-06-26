public class InventoryAddRequest
    {
        
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid number")]
        public int WorkShopId { get; set; }

        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid number")]
        public int Quantity { get; set; }

        [Required]
        [Range(0.01, int.MaxValue, ErrorMessage = "Price must be between 0.01 and 1000000.00")]
        public decimal BasePrice { get; set; }

    }
