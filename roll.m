function out = roll(nDice)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    out.nDice = nDice;
    diceNumber = randi(6, nDice, 2);
    points = sum(diceNumber);

    out.userPoint = points(1);
    out.computerPoint = points(2);
    out.userDice = diceNumber(:,1);
    out.computerDice = diceNumber(:,2);
end

