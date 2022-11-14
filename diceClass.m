classdef diceClass
    %DICECLASS Summary of this class goes here
    %   Detailed explanation goes here
    
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
            %   Detailed explanation goes here
            out.nDice = obj.nDice;
            out.nSides = obj.nSides;
            out.userPoint = obj.userPoint;
            out.computerPoint = obj.computerPoint;
            out.userDice = obj.userDice;
            out.computerDice = obj.computerDice;
        end

        function out = reroll(obj)
            rerolled = roll(obj.nDice,obj.nSides);

            obj.userDice = rerolled.userDice;
            obj.userPoint = rerolled.userPoint;
            
            if rerolled.computerPoint>obj.computerPoint
                obj.computerPoint = rerolled.computerPoint;
                obj.computerDice = rerolled.computerDice;
            end

            out = obj;
        end
        
        function outputArg = setUser(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.diceNumber + inputArg;
        end
    end
end