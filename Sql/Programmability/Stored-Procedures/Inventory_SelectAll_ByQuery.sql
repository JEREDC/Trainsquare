ALTER PROC [dbo].[Inventory_SelectAll_ByQuery]
			@pageIndex int
			,@pageSize int
			,@Query nvarchar(100)

AS

/*

	DECLARE	@pageIndex int = 0
			,@pageSize int = 20
			,@Query nvarchar(100) = 'Crochet'

	EXECUTE	[dbo].[Inventory_SelectAllV2]_ByQuery 
			@pageIndex
			,@pageSize
			,@Query

*/

BEGIN

	DECLARE @offset int = @pageIndex * @pageSize

	SELECT	i.Id
			,ws.[Id] AS workShopId
			,ws.[Name]
			,ws.[Summary]
			,ws.[ShortDescription]
			,ws.[VenueId]
			,u.UserId
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
			,i.Quantity
			,i.BasePrice
			,i.DateCreated
			,i.DateModified
			,i.CreatedBy
			,i.ModifiedBy
			,TotalCount = COUNT(1) OVER()

	FROM	[dbo].[Inventory] AS i 
			INNER JOIN [dbo].[WorkShop] AS ws 
				ON i.workshopId = ws.Id 
			LEFT JOIN [dbo].[Venues] AS v 
				ON ws.VenueId = v.Id
			LEFT JOIN [dbo].[WorkShopStatus] AS wss 
				ON ws.WorkShopStatusId = wss.Id
			LEFT JOIN [dbo].[WorkShopTypes] AS wst 
				ON ws.WorkShopTypeId = wst.Id
			LEFT JOIN [dbo].[UserProfiles] AS u 
				ON ws.HostId = u.UserId

		WHERE(
			ws.[Name] LIKE '%' + @Query + '%' OR
			ws.[Summary] LIKE '%' + @Query + '%' OR
			ws.[ShortDescription] LIKE '%' + @Query + '%'  
			 )

	ORDER BY i.Id
	Offset @offset ROWS
	FETCH NEXT @pageSize ROWS ONLY 

END
