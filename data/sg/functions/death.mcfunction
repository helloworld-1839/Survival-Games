# SG death
## ran as player


# xp
summon experience_bottle ~ ~ ~ {Motion:[0.1,0.7,0.0]}
summon experience_bottle ~ ~ ~ {Motion:[-0.05,0.7,0.087]}
summon experience_bottle ~ ~ ~ {Motion:[-0.05,0.7,-0.087]}

# world
gamemode spectator @s

# announce
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"☠","color":"red"},{"text":"] ","color":"dark_gray"},{"selector":"@s","color":"dark_red"},{"text":" has been eliminated!","color":"red"}]
# sfx
execute as @a at @s run playsound minecraft:entity.lightning_bolt.thunder player @s


scoreboard players remove alive players 1
execute if entity @s[team=red] run scoreboard players remove red players 1
execute if entity @s[team=blue] run scoreboard players remove blue players 1
execute if entity @s[team=yellow] run scoreboard players remove yellow players 1
execute if entity @s[team=green] run scoreboard players remove green players 1
scoreboard players reset @s death