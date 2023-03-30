# SG main loop


# set gamemode
## for servers with default gamemodes
gamemode adventure @a[gamemode=survival]

# welcome notice
## appears when game is not in progress
## is disabled in realms mode
execute unless score realms global matches 1.. if score period internal matches -1 run title @a actionbar ["",{"text":"Welcome! ","color":"gold","bold":true},{"text":"Ready for a new game? Run "},{"text":"/function sg:start","color":"yellow"},{"text":" and let the games begin!"}]

# reset spawn
## tied directly to map
execute if score realms global matches 1.. if score period internal matches -1 run spawnpoint @a 0 315 0
execute if score realms global matches 1.. if score period internal matches -1 run setworldspawn 0 315 0
execute if score realms global matches 1.. unless score period internal matches -1 run spawnpoint @a 0 160 0
execute if score realms global matches 1.. unless score period internal matches -1 run setworldspawn 0 160 0
# lobby-specific features
execute if score realms global matches 1.. if score period internal matches -1 run function sg:system/lobby/main

# debug mode
## used for marking custom items
execute if score debug internal matches 1 run function sg:system/debug

# custom items
function sg:summon/main

# general checks
## clear of glow berries
clear @a[gamemode=!creative] glow_berries
## kill tnt entities
execute if entity @e[type=tnt] run kill @e[type=tnt]

# snow particles
## snow_particles
execute if score snow_particles global matches 1.. as @a at @s if block ~ ~ ~ minecraft:snow run particle minecraft:snowflake ~ ~2 ~ 10 10 10 0 6 force

# border
execute if score period internal matches 1 unless score border_change internal matches 1 as @e[tag=border_trans] at @s facing entity @e[tag=bordercentre,tag=temp] feet unless entity @e[tag=bordercentre,tag=temp,distance=..5] run tp ^ ^ ^0.042
execute if score period internal matches 1 unless score border_change internal matches 1 as @e[tag=border_trans] at @s run worldborder center ~ ~
execute if score period internal matches 1 unless score border_change internal matches 1 as @e[tag=border_trans] at @s run tag @e[tag=bordercentre,tag=temp,distance=..5] remove temp

# time
execute if score period internal matches 1 run function sg:time
## display if in debug mode
execute if score period internal matches 1 if score debug internal matches 1.. run title @a actionbar {"score":{"name":"time_s","objective":"internal"},"color":"gold","bold":true,"italic":true}

# reset
## place into spawn pods
execute if score reset internal matches 1 as @e[tag=spawn] at @s if entity @a[distance=..1.5] run tag @s add taken
execute if score reset internal matches 1 as @e[tag=spawn] at @s if entity @a[distance=..1.5] run tag @a[distance=..1.5] add taken
execute if score reset internal matches 1 as @e[tag=spawn] at @s unless entity @a[distance=..1.5] run tag @s remove taken
execute if score reset internal matches 1 as @a at @s unless entity @e[tag=spawn,distance=..1.5] run tag @s remove taken
## teleport players
execute if score reset internal matches 1 run function sg:reset/players

# pre-start
## effect slowness
execute if score period internal matches 0 run effect give @a[tag=taken] slowness 1 255 true
## remove tags for reset
execute unless score period internal matches 0 run tag @a[tag=taken] remove taken
## reset custom blocks
function sg:reset/blocks

# track deaths
execute as @a at @s if score @s death matches 1.. if score period internal matches 1 run function sg:death

# track victory
## solos
execute as @a at @s unless score teams global matches 1.. if score alive players matches ..1 if score period internal matches 1 run function sg:system/win/go
## teams
# ## red
# execute as @a at @s if score teams global matches 1.. if score red players matches 1.. unless score blue players matches 1.. if score period internal matches 1 run function sg:system/win/red
# ## blue
# execute as @a at @s if score teams global matches 1.. if score blue players matches 1.. unless score red players matches 1.. if score period internal matches 1 run function sg:system/win/blue

## track victories 2 - please help i have no idea what im doing how do i implement this properly its 2am what the hell am i doing
execute as @a at @s if score teams global matches 1.. if score red players matches 1.. unless score blue players matches 1.. unless score yellow players matches 1.. unless score green players matches 1.. if score period internal matches 1 run function sg:system/win/red
execute as @a at @s if score teams global matches 1.. if score blue players matches 1.. unless score red players matches 1.. unless score yellow players matches 1.. unless score green players matches 1.. if score period internal matches 1 run function sg:system/win/blue
execute as @a at @s if score teams global matches 1.. if score yellow players matches 1.. unless score blue players matches 1.. unless score red players matches 1.. unless score green players matches 1.. if score period internal matches 1 run function sg:system/win/yellow
execute as @a at @s if score teams global matches 1.. if score green players matches 1.. unless score blue players matches 1.. unless score yellow players matches 1.. unless score red players matches 1.. if score period internal matches 1 run function sg:system/win/green