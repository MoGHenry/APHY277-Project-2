%%
clear; clc; close all;
%%

% get input from the use for number of dice and number of sides 
ndice = input("How many dices?\n: ");
nside = input("How many sides do you want?");
%%
%call function in roll class
rolled = roll(ndice, nside);
%create a dice object
diceObj = diceClass(rolled);
%display user score
disp(diceObj.userPoint);
% let command window be active
commandwindow();
%% while loop to ask user if they want to reroll and will run till they say no
while strcmp(input("Do you want to reroll?(y/n)\n: ", 's'), 'y')
    %reroll the dice
    diceObj = reroll(diceObj);
    %display the score
    disp(diceObj.userPoint);
    % let command window be active after plotting
    commandwindow();
end
%prints computer score
disp("COMPUTER SCORE:")
disp(diceObj.computerPoint);
%tells the users if they won or lost 
if diceObj.computerPoint > diceObj.userPoint
    disp("YOU LOST BETTER LUCK NEXT TIME! :(")
elseif diceObj.computerPoint < diceObj.userPoint
    disp("YOU WON :)")
elseif diceObj.computerPoint == diceObj.userPoint
    disp("A TIE WOW")
end
%%
%set up matrix for y y will be abount of times won
y = zeros(10,1);
%will be how many times the user wants to simulate for amount of times
%rerolled
strategyScoreList = zeros(10,1);
%for loop for ten times 
for i = 1:10
    %anoymous  function to roll the dice
    sim = @(nSide, nDice) randi([1 nSide], 1, nDice);
    NumRoll = 100000;
    %max points you could get
    maxPoint = ndice*nside;
    %ask how many times they want to reroll for simulation
    strategyScore = input(strcat("The max point is ",num2str(maxPoint), ". What's your strategy score?\n: "));
    strategyScoreList(i) = strategyScore;
    won = 0;
    for j = 1:100000
    %sums the users and computer points points 
    userPoint = sum(sim(nside,ndice));
    computerPoint = sum(sim(nside,ndice));
    %sees who won
    if(userPoint>strategyScore)
        userPoint = sum(sim(nside,ndice));
        tempComputerPoint = sum(sim(nside,ndice));
        %update the computers points
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
%%plots the bar graph
figure;
bar(strategyScoreList,y);