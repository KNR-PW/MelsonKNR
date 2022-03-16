import pygame
from time import sleep

pygame.joystick.init()
joysticks = [pygame.joystick.Joystick(x) for x in range(pygame.joystick.get_count())]

gamepad = pygame.joystick.Joystick(0)
gamepad.init()

if gamepad.get_init():
    print(gamepad.get_id())
    print(gamepad.get_name())
    print(gamepad.get_numaxes())
    print(gamepad.get_numbuttons())
    print(gamepad.get_numhats())

x=[1]*12
for i in range(12):
    x[i]= bool(gamepad.get_button(i))


while gamepad.get_init():
    for i in range(12):
        x[i] = bool(gamepad.get_button(i))
    print(x)
    sleep(1)




pygame.joystick.quit()