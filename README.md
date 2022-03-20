# 2020年新工科联盟-Xilinx暑期学校（Summer School）项目
- 经典游戏复现之Flappy-Bird
# 项目成员
- cfl 2018112786
- wcx 2018112784
# 项目介绍
- 本项目通过ESP32开发板的HDMI-mini接口连接屏幕等外设，通过传递HDMI视频信号在屏幕上显示图像，之后进行源码编写复现游戏的一些列功能和玩法。
玩家通过开发板上的key按键来操纵小鸟移动通过柱子缺口来获得分数，累计一定分数将会动态增加难度，并在死亡后显示玩家得分。
# 板卡型号与外设列表
- 板卡型号: SEA
- 芯片型号：spartan7 xcs15
# ⼯具版本
- vivado2018.3
- Arduino IDE 1.8.3
# 已实现功能
- 目前将开发板通过数据线连接至屏幕，将会显示welcom开始界面，按键后进入flappy-bird。游戏中，小鸟下坠，柱子移动并产生随机高度的空缺，判断小鸟的得分和死亡情况，根据玩家的得分改变小鸟下坠速度和柱子移动速度来动态增加难度。当小鸟通过柱子的空缺口时，得分就会＋1，当得分数每加3时，柱子移动的速度就更快一些，小鸟下坠的速度也更快一些，由此实现了难度的动态增加。当小鸟撞到柱子或者飞到屏幕上下外时，就会判断为死亡，随后在屏幕上显示相应得分。
# 核心算法思想
## video 图像产生模块：
- 我们采用matlab生成固定像素大小的bird的图片，通过驱动模块和ROM IP核实现图像显示。
对于柱子，我们计算其实时边界，采用16进制RGB色彩上色，以此避免开发板的ROM不足，无法加载图片。
## 得分显示部分：
- 死亡后根据得分在屏幕上显示对应分数是一个复杂的过程，我们需要框定每一个数字在屏幕上的范围再上色，如此一来工程量将会十分巨大。
但是我们联想到数码管的数字显示方法，确定了类似数码管的7根数字条在屏幕上的边界范围，通过组合来显示数字。如此一来极大的降低了工程量。
## 柱子移动模块与小鸟移动模块：
- 两个图像元素都需要随着时序变化不断移动，其原理是在合适的时钟频率下，改变bird的xy坐标与pipe的xy坐标，传入vedio模块，在坐标的基础上划定边界范围，进行上色
这样就实现了柱子边界与小鸟边界的动态变化，实现了图像的运动。
### 动态难度
- 为了防止游戏过于单一，我们需要给游戏动态增加难度，随着玩家分数的累计，我们将会逐渐加快柱子坐标的移动速度，实现柱子的移动速度增加，并且相应增加了小鸟的下坠速度，实现了游戏难度的动态增加。
### 缺口的随机算法
- 为防止每次的游戏经历的雷同，柱子缺口的高度不能人为设置。为了增加游戏乐趣，实现缺口高度的随机变化，我们并没有采用LFSR产生随机数，而是创新性的研究了我们自己的随机算法。
我们通过向pipe模块实时导入bird_y（小鸟y坐标）的数据，在小鸟每越过一根柱子空缺后，进入下一根柱子空缺前，读取bird_y的坐标数据，进行我们构造的函数运算，生成下一个柱子pipe_y坐标的数据，
以此实现了空缺高度的随机。这样做的好处在于我们可以规避LFSR产生随机数出现的一些例如连续两根柱子的空缺高度差极大，玩家完全无法通过的极端情况，保证了每次柱子空缺高度的合理性，同时也增加了游戏随机的乐趣。
# 更新日志
- 2020.8.2 -- v1.0
