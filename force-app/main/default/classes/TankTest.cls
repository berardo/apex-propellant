@isTest
public with sharing class TankTest {
  @isTest
  public static void testCapacityConsumedConstructor() {
    Tank t = new Tank(10, 5);
    System.assertEquals(10, t.capacity, 'Capacity not properly assigned');
    System.assertEquals(5, t.consumed, 'Consumed not properly assigned');
  }

  @isTest
  public static void testCapacityOnlyConstructor() {
    Tank t = new Tank(10);
    System.assertEquals(10, t.capacity, 'Capacity not properly assigned');
    System.assertEquals(0, t.consumed, 'Consumed not properly assigned');
  }

  @isTest
  public static void testDefaultConstructor() {
    Tank t = new Tank();
    System.assertEquals(5, t.capacity, 'Capacity not properly assigned');
    System.assertEquals(0, t.consumed, 'Consumed not properly assigned');
  }

  @isTest
  public static void testIsEmpty() {
    Tank t1 = new Tank();
    Tank t2 = new Tank(10, 10);
    System.assertEquals(false, t1.isEmpty(), 'T1 must not be empty');
    System.assert(t2.isEmpty(), 'T2 must be empty');
  }

  @isTest
  public static void testConsume() {
    Tank t1 = new Tank(2, 0);
    Tank t2 = t1.consume();
    Tank t3 = t2.consume();
    System.assertEquals(false, t1.isEmpty(), 'T1 must not be empty');
    System.assertEquals(false, t2.isEmpty(), 'T2 must not be empty');
    System.assert(t3.isEmpty(), 'T3 must be empty');

    try {
      Tank t4 = t3.consume();
      System.assert(false, 'There must not be anything left to consume');
    } catch (EmptyTankException ex) {
      System.debug('t3.consume() raised exeption');
    }
  }
}
