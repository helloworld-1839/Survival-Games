# SG start
## will start instantly, avoiding countdown


scoreboard players set period internal 1
scoreboard players reset @a death
tag @a remove taken
tag @e remove temp

# track alive players
scoreboard players reset alive players
execute as @a run scoreboard players add alive players 1
## teams
scoreboard players reset red players
scoreboard players reset blue players
scoreboard players reset yellow players
scoreboard players reset green players
execute as @a[team=red] run scoreboard players add red players 1
execute as @a[team=blue] run scoreboard players add blue players 1
execute as @a[team=yellow] run scoreboard players add yellow players 1
execute as @a[team=green] run scoreboard players add green players 1

# world
worldborder set 500 10

# loot chests
function sg:chest/loot

# announce
title @a title ""
title @a subtitle ""
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"✔","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Game started!","color":"aqua"}]
# sfx
execute as @a at @s run playsound entity.arrow.hit_player player @s ~ ~ ~
execute as @a at @s run playsound entity.generic.explode player @s ~ ~ ~

# effects
effect clear @a
## particles
execute as @e[tag=spawn] at @s run particle minecraft:glow ~ ~ ~ 0 0 0 1 10
execute as @e[tag=chest_tier] at @s run particle minecraft:glow ~ ~-2 ~ 0 0 0 1 10

execute as @e[tag=copyblock] at @s run clone ~ ~ ~ ~ ~ ~ ~ ~100 ~

# give resistance at start
## aka. grace period
execute if score grace_period global matches 1.. run effect give @a resistance 7 255 true