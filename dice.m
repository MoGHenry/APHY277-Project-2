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
% disp(diceObj.computerPoint);

% let command window be active after plotting
commandwindow();
%%
while strcmp(input("Do you want to reroll?(y/n)\n: ", 's'), 'y')
    diceObj = reroll(diceObj);
    disp(diceObj.userPoint);
    % computer point will be hide
%     disp(diceObj.computerPoint);
    % plot a random figure
%     close; figure; plot(1);
    % let command window be active after plotting
    commandwindow();
end
%%
y = zeros(10,1);
strategyScoreList = zeros(10,1);
for i = 1:10
    sim = @(nSide, nDice) randi([1 nSide], 1, nDice);
    NumRoll = 10000;
    maxPoint = ndice*nside;
    strategyScore = input(strcat("The max point is ",num2str(maxPoint), ". What's your strategy score?\n: "));
    strategyScoreList(i) = strategyScore;
    won = 0;
    for j = 1:1000
    userPoint = sum(sim(nside,ndice));
    computerPoint = sum(sim(nside,ndice));
    if(userPoint>strategyScore)
        userPoint = sum(sim(nside,ndice));
        tempComputerPoint = sum(sim(nside,ndice));
        if tempComputerPoint>computerPoint
            computerPoint = tempComputerPoint;
        end
    end
        if userPoint > computerPoint
            won = won+1;
        end

    end
    y(i) = won;
end
%%
figure;
bar(strategyScoreList,y);
