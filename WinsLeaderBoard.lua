--									WINS LEADERBOARD
for i = 1, 16 do
	local Sam = script.Sample:Clone()
	Sam.Parent = script.Parent.SurfaceGui.Frame.ScrollingFrame
	Sam.Name = i
	Sam.Rank.Text = "#" .. tostring(i)
	--Sam.Username = "Player Name"
	Sam.LayoutOrder = i
end

function UpdateGui()
	local WinsLeaderboard = game:GetService("DataStoreService"):GetOrderedDataStore("TopWins")
	local data = WinsLeaderboard:GetSortedAsync(false,16)
	local page = data:GetCurrentPage()

	for i, v in ipairs(page) do
		--print(v.key)
		if tonumber(v.key) >= 1 then
			local Frame = script.Parent.SurfaceGui.Frame.ScrollingFrame:FindFirstChild(i)
			if Frame then
				Frame.Username.Text = game.Players:GetNameFromUserIdAsync(v.key)
				Frame.WinCount.Text = v.value
				--print(game.Players:GetNameFromUserIdAsync(v.key))
				--print(v.value)
			end
		end
		wait()
	end
end

while true do
	UpdateGui()
	wait(90)
	--players cannot see their position change on the leaderboards because their new
	--scores don't save until they leave
end