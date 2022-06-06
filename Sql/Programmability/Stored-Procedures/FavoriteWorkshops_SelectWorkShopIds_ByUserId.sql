ALTER Proc [dbo].[FavoriteWorkshops_SelectWorkShopIds_ByUserId]
			@UserId int

/* ------------- TEST CODE ---------------------

	Declare @UserId int = 260

	Execute dbo.FavoriteWorkshops_SelectWorkShopIds_ByUserId
				@UserId


*/

as

BEGIN

	Select WorkShopId
	From dbo.FavoriteWorkshops
	Where UserId = @UserId

END
