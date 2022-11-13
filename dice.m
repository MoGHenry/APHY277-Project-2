%%
clear; clc; close all;
%%

% no idea where to use anonymous function!!!!!!

ndice = input("How many dices?\n: ");
nside = input("How many sides do you want?");
%%
rolled = roll(ndice, nside);
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
%%
disp(diceObj.computerPoint);
sim = @(nside ndice) randi([1 nside], 1, ndice);


close;