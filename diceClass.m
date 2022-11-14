classdef diceClass
    %DICECLASS Summary of this class goes here
    %   Detailed explanation goes here
    %set teh properties
    properties
        nDice {mustBeNonzero}
        nSides {mustBeNonzero}
        userPoint {mustBeNumeric}
        computerPoint {mustBeNumeric}
        userDice {mustBeNumeric}
        computerDice {mustBeNumeric}
    end
    
    methods
        function out = diceClass(obj)
            %DICECLASS Construct an instance of this class
            % gives us the ability to get what value we need for diffrent areas
            out.nDice = obj.nDice;
            out.nSides = obj.nSides;
            out.userPoint = obj.userPoint;
            out.computerPoint = obj.computerPoint;
            out.userDice = obj.userDice;
            out.computerDice = obj.computerDice;
        end

        function out = reroll(obj)
            %for rerolling the dice we call roll
            rerolled = roll(obj.nDice,obj.nSides);
            %we update the objects
            obj.userDice = rerolled.userDice;
            obj.userPoint = rerolled.userPoint;
            %update computers score
            if rerolled.computerPoint>obj.computerPoint
                obj.computerPoint = rerolled.computerPoint;
                obj.computerDice = rerolled.computerDice;
            end

            out = obj;
        end
    end
end