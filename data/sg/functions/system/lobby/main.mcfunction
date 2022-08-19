# SG lobby loop
## binds button functionality n things


# world
worldborder set 1000

# reset XP
xp set @a 0 levels
xp set @a 0 points

# effects
effect give @a resistance 9999 255 true
effect give @a regeneration 9999 255 true
effect give @a saturation 9999 255 true

# display team
title @a[team=red] actionbar ["",{"text":"You are on Team "},{"text":"Red","color":"red"}]
title @a[team=blue] actionbar ["",{"text":"You are on Team "},{"text":"Blue","color":"blue"}]
title @a[team=!red,team=!blue] actionbar ["",{"text":"Join a team by standing on a colour."}]

# set team blocks
execute if score teams global matches 1.. run fill -4 315 4 -4 315 2 red_carpet replace air
execute if score teams global matches 1.. run fill -4 315 -2 -4 315 -4 blue_carpet replace air
execute if score teams global matches 1.. run fill -4 315 1 -4 315 -1 light_gray_carpet replace air
## clear
execute unless score teams global matches 1.. run fill -4 315 4 -4 315 2 air replace red_carpet
execute unless score teams global matches 1.. run fill -4 315 -2 -4 315 -4 air replace blue_carpet
execute unless score teams global matches 1.. run fill -4 315 1 -4 315 -1 air replace light_gray_carpet

# detect team blocks
execute if score teams global matches 1.. as @a at @s if block ~ ~ ~ red_carpet run team join red
execute if score teams global matches 1.. as @a at @s if block ~ ~ ~ blue_carpet run team join blue
execute if score teams global matches 1.. as @a at @s if block ~ ~ ~ light_gray_carpet run team leave
## clear
execute unless score teams global matches 1.. run team leave @a

# get spectator height
execute as @a[gamemode=spectator] store result score @s spectator_height run data get entity @s Pos[1]

# set gamemode
execute as @a[gamemode=spectator] if score @s spectator_height >= return_height internal run tp @s 0 315 0
execute as @a[gamemode=spectator] if score @s spectator_height >= return_height internal run gamemode adventure @s

# buttons
## START GAME
execute if block 0 316 4 stone_button[powered=true] run function sg:start
execute if block 0 316 4 stone_button[powered=true] run setblock 0 316 4 stone_button[powered=false]
## EXPLORE MAP
execute if block 0 316 -4 stone_button[powered=true] positioned 0 316 -4 as @p[distance=..3.5] run function sg:system/lobby/explore
execute if block 0 316 -4 stone_button[powered=true] run setblock 0 316 -4 stone_button[powered=false,facing=south]
## MODE
## <
execute if block 4 316 -1 stone_button[powered=true] run scoreboard players remove mode global 1
execute if block 4 316 -1 stone_button[powered=true] run setblock 4 316 -1 stone_button[powered=false,facing=west]
## >
execute if block 4 316 1 stone_button[powered=true] run scoreboard players add mode global 1
execute if block 4 316 1 stone_button[powered=true] run setblock 4 316 1 stone_button[powered=false,facing=west]
## TEAMS
## <
execute if block -4 316 1 stone_button[powered=true] run scoreboard players remove teams global 1
execute if block -4 316 1 stone_button[powered=true] run setblock -4 316 1 stone_button[powered=false,facing=east]
## >
execute if block -4 316 -1 stone_button[powered=true] run scoreboard players add teams global 1
execute if block -4 316 -1 stone_button[powered=true] run setblock -4 316 -1 stone_button[powered=false,facing=east]

# range check
## MODE
execute unless score mode global matches 0.. run scoreboard players set mode global 0
execute unless score mode global matches ..1 run scoreboard players set mode global 1
## TEAMS
execute unless score teams global matches 0.. run scoreboard players set teams global 0
execute unless score teams global matches ..1 run scoreboard players set teams global 1

# display
## MODE
execute if score mode global matches 0 run data merge block 4 316 0 {Color:"black",Text3:'{"text":"experience."}',Text2:'{"text":"The classic"}',Text1:'{"text":"NORMAL"}',GlowingText:1b}
execute if score mode global matches 1 run data merge block 4 316 0 {Color:"black",Text3:'{"text":"loot-tables!"}',Text2:'{"text":"Overpowered"}',Text1:'{"text":"BOOSTED","color":"light_purple"}',GlowingText:1b}
## TEAMS
execute if score teams global matches 0 run data merge block -4 316 0 {Color:"black",Text3:'{"text":""}',Text2:'{"text":"Free for all."}',Text1:'{"text":"SOLOS"}',GlowingText:1b}
execute if score teams global matches 1 run data merge block -4 316 0 {Color:"black",Text3:'{"text":"death together!"}',Text2:'{"text":"Fight to the"}',Text1:'{"text":"TEAMS"}',GlowingText:1b}