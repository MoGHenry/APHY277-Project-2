function out = roll(nDice, nSides)
    %UNTITLED Summary of this function goes here
    %   initalize the varibles 
    out.nDice = nDice;
    out.nSides = nSides;
    %rolls the dice
    diceNumber = randi(nSides, nDice, 2);
    %checks to see how many dice the user put in
    if nDice > 1
        %set the points for the user computer 
        points = sum(diceNumber);
        out.userPoint = points(1);
        out.computerPoint = points(2);
        out.userDice = diceNumber(:,1);
        out.computerDice = diceNumber(:,2);
    elseif nDice == 1
        %set the points for the user computer 
        out.userPoint = diceNumber(1);
        out.computerPoint = diceNumber(2);
        out.userDice = diceNumber(:,1);
        out.computerDice = diceNumber(:,2);
    end

end