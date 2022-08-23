# SG win
## blue


scoreboard players set period internal 3
scoreboard players reset alive players
scoreboard players reset red players
scoreboard players reset blue players

# range check kills
execute as @a unless score @s kills matches 0.. run scoreboard players set @s kills 0

# total team kills
scoreboard players set red_kills internal 0
scoreboard players set blue_kills internal 0
execute as @a[team=red] run scoreboard players operation red_kills internal += @s kills
execute as @a[team=blue] run scoreboard players operation blue_kills internal += @s kills

# announce
title @s title {"text":"GAME OVER!","color":"blue","bold":true}
title @s subtitle [{"text":"Blue has won the game."}]
tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"✔","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Blue","color":"blue"},{"text":" won with ","color":"green"},{"score":{"name":"blue_kills","objective":"internal"},"color":"dark_green"},{"text":" kills!","color":"green"}]
# sfx
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~

# effects
effect give @s resistance 9999 255 true
execute as @a[gamemode=adventure] at @s run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Flight:1,Explosions:[{Type:1,Flicker:0,Trail:0,Colors:[I;2238199],FadeColors:[I;3309297]}]}}}}


# announce
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"✔","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Game over!","color":"aqua"}]
# sfx
playsound entity.arrow.hit_player player @s ~ ~ ~ 100 0.5

# display own kills
tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"⭐","color":"gold"},{"text":"] ","color":"dark_gray"},{"text":"You got ","color":"gray"},{"score":{"name":"@s","objective":"kills"},"color":"green"},{"text":" kills this round.","color":"gray"}]


# return to lobby
schedule function sg:lobby 5s