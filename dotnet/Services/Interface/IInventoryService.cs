 public interface IInventoryService
    {
        int Add(InventoryAddRequest model, int Id);

        void Delete(int id);

        Inventory Get(int id);

        void Update(InventoryUpdateRequest model, int Id);

        Paged<InventoryDetails> GetPaginate(int pageIndex, int pageSize);
        
        Paged<InventoryDetails> GetPaginateSearch(int pageIndex, int pageSize, string query);

    }
