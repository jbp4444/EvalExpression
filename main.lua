#!/usr/local/bin/lua

require( "EvalExpression" )

debuglevel = 20
function dprint( lvl, text )
	if( lvl <= debuglevel ) then
		print( text )
	end
end

function runTest( text, expected, params )
	local output = evalString( text, params )
	
	if( math.abs((output+0)-(expected+0)) < 0.0001 ) then
		print( "running test for ["..text.."] .. expected [" ..expected.. "] .. CORRECT" )
	else
		print( "running test for ["..text.."] .. expected [" ..expected.. "] .. ERROR .. ["
			.. output .. "]" )
	end
end

-- simple tests
runTest( "1+2", 3 )
runTest( "1+2+3", 6 )
runTest( "1*2*3", 6 )
runTest( "(1+2)*3", 9 )
runTest( "1*(2+3)", 5 )
runTest( "1.1+2.2", 3.3 )
runTest( "1.1+2.2+3.3", 6.6 )
runTest( "1.1*2.2*3.3", 7.986 )
runTest( "(1.1+2.2)*3.3", 10.89 )
runTest( "1.1*(2.2+3.3)", 6.05 )
runTest( "-2*3", -6 )
runTest( "2*-3", -6 )

print( "from bug reports from github..." )
runTest( "(42 / 100) - 47 / (30 - 130)", 0.89 )

-- use params list
params = {
	a = 1,
	b = 2,
	c = 3
}
runTest( "a+b", 3, params )
runTest( "a+b+c", 6, params )
runTest( "a*b*c", 6, params )
runTest( "(a+b)*c", 9, params )
runTest( "a*(b+c)", 5, params )
runTest( "-b*c", -6, params )
runTest( "b*-c", -6, params )

-- add another variable
params["d"] = 4
runTest( "d*d", 16, params )
