namespace Sabio.Services.Interfaces
{
    public interface IFavoriteWorkshopService
    {
        public int Add(FavoriteWorkshopAddRequest model, int userId);
        public Paged<WorkShop> GetAllByUserId(int userId, int pageIndex, int pageSize);
        public Paged<WorkshopWithFavoriteCount> GetAllFavoriteWorkshops(int pageIndex, int pageSize);
        public Paged<WorkshopWithFavoriteCount> Search(int pageIndex, int pageSize, string query);
        public List<WorkshopId> GetFavoriteWorkshopIds(int userId);
        public void Delete(int workShopId, int userId);
    }
}
