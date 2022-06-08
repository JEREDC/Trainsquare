ALTER Proc [dbo].[FavoriteWorkshops_SelectAll]
		@PageIndex int,
		@PageSize int

/* ------------- TEST CODE ---------------------

	Declare @PageIndex int =  0,
		@PageSize int = 5

	Execute dbo.FavoriteWorkshops_SelectAll
		@PageIndex,
		@PageSize

*/

as

BEGIN

	Declare @offset int = @PageIndex * @PageSize

	Select ws.[Id], COUNT(ws.Id) AS 'TotalFavorited'
		,ws.[Name]
		,ws.[Summary]
		,ws.[ShortDescription]
		,ws.[VenueId]
		,u.Id
		,u.FirstName 
		,u.LastName
		,u.AvatarUrl
		,wst.Name as workShopType
		,wss.Name workShopStatus
		,ws.[ImageUrl]
		,ws.[ExternalSiteUrl]
		,ws.[LanguageId]
		,ws.[IsFree]
		,ws.[NumberOfSessions]
		,ws.[DateStart]
		,ws.[DateEnd]
		,ws.[DateCreated]
		,ws.[DateModified]
		,TotalCount = COUNT(1) OVER()
			

	From dbo.FavoriteWorkshops as f LEFT JOIN dbo.WorkShop as ws
						on f.WorkShopId = ws.Id
						INNER JOIN dbo.Venues as v
						on ws.VenueId = v.Id
						INNER JOIN dbo.WorkShopStatus as wss
						on ws.WorkShopStatusId = wss.Id
						INNER JOIN dbo.WorkShopTypes as wst
						on ws.WorkShopTypeId = wst.Id
						INNER JOIN dbo.UserProfiles as u
						on ws.HostId = u.UserId

	Group by ws.[Id]
		,ws.[Name]
		,ws.[Summary]
		,ws.[ShortDescription]
		,ws.[VenueId]
		,u.Id
		,u.FirstName 
		,u.LastName
		,u.AvatarUrl
		,wst.Name 
		,wss.Name
		,ws.[ImageUrl]
		,ws.[ExternalSiteUrl]
		,ws.[LanguageId]
		,ws.[IsFree]
		,ws.[NumberOfSessions]
		,ws.[DateStart]
		,ws.[DateEnd]
		,ws.[DateCreated]
		,ws.[DateModified]

	Order by TotalFavorited DESC

	OFFSET @offset Rows
	FETCH NEXT @PageSize Rows Only

END
