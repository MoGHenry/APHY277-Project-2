function out = roll(nDice, nSides)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    out.nDice = nDice;
    out.nSides = nSides;
    diceNumber = randi(nSides, nDice, 2);
    if (nDice > 1)
    points = sum(diceNumber);
    out.userPoint = points(1);
    out.computerPoint = points(2);
    out.userDice = diceNumber(:,1);
    out.computerDice = diceNumber(:,2);
    
else if (nDice == 1)
    out.userPoint = diceNumber(1);
    out.computerPoint = diceNumber(2);
    out.userDice = diceNumber(:,1);
    out.computerDice = diceNumber(:,2);
end

end
