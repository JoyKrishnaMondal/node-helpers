lo = require "lodash"

colors = require "colors/safe"

{red} = colors 

DefaultFn = (UserInput,DefaultType) ->

	Keys = lo.keys DefaultType

	for I in Keys

		{type,value} = DefaultType[I]

		switch type UserInput[I]
		| true =>
		| false => 
			if value is undefined
				UserInput[I]  = "< ? ? >"
				try
					throw  red ("Error: '#{I}' key-value is not defined in :\n" + JSON.stringify UserInput,null,"\t" )
				catch E
					console.log E
					UserInput[I]  = undefined
			else
				UserInput[I] = value
		| otherwise =>
			throw red "Error: Default type for #{I} is not defined."


		if not (DefaultType[I].type (UserInput[I]))

			UserInput[I] = DefaultType[I].value

	UserInput

module.export = DefaultFn