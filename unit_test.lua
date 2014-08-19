function my_super_function( arg1, arg2 ) return arg1 + arg2 end
function my_bad_function( arg1, arg2 ) return arg1 - arg2 end

-- Unit testing starts
LuaUnit = require('luaunit')

-- now, we perform all the tests on int in one test class
-- and the tests on float in another one
-- when your test grows, you will have many test classes

TestWithInt = {} --class
    function TestWithInt:setUp() 
        -- this function is run before each test, so that multiple
        -- tests can share initialisations
        self.a = 1
        self.b = 2
    end

    function TestWithInt:tearDown() 
        -- this function is executed after each test
        -- here, we have nothing to do so we could have avoid
        -- declaring it
    end

    function TestWithInt:testSuperFunction()
        result = my_super_function( self.a, self.b )
        assertEquals( type(result), 'number' )
        assertEquals( result, 3 )
    end

    function TestWithInt:testBadFunction()
        result = my_bad_function( self.a, self.b )
        assertEquals( type(result), 'number' )
        assertEquals( result, -1 )
    end

    function TestWithInt:testThatFails()
        -- you can test anything with assertEquals
        assertEquals( self.a, 1 )
        assertEquals( type(self.a), 'number' )
        -- will fail
        assertEquals( 'hop', 'bof' )
    end
-- class TestWithInt

TestWithFloat = {} --class
    function TestWithFloat:setUp() 
        -- this function is run before each test, so that multiple
        -- tests can share initialisations
        self.a = 1.1
        self.b = 2.1
    end

    function TestWithFloat:tearDown() 
        -- this function is executed after each test
        -- here, we have nothing to do so we could have avoid
        -- declaring it
    end

    function TestWithFloat:testSuperFunction()
        result = my_super_function( self.a, self.b )
        assertEquals( type(result), 'number' )
        -- will fail
        assertEquals( result, 3 )
    end

    function TestWithFloat:testBadFunction()
        result = my_bad_function( self.a, self.b )
        assertEquals( type(result), 'number' )
        -- will work, but only by chance :-)
        assertEquals( result, -1 )
    end
-- class TestWithFloat

LuaUnit:run()
