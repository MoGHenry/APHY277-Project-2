%%
clear; clc; close all;
%%

% no idea where to use anonymous function!!!!!!

ndice = input("How many dices?\n: ");
%%
rolled = roll(ndice);
diceObj = diceClass(rolled);
disp(diceObj.userPoint);
% computer point will be hide
disp(diceObj.computerPoint);
% plot a random figure
figure; plot(1);
% let command window be active after plotting
commandwindow();
%%
while strcmp(input("Do you want to reroll?(y/n)\n: ", 's'), 'y')
    diceObj = reroll(diceObj);
    disp(diceObj.userPoint);
    % computer point will be hide
    disp(diceObj.computerPoint);
    % plot a random figure
    close; figure; plot(1);
    % let command window be active after plotting
    commandwindow();
end
close;