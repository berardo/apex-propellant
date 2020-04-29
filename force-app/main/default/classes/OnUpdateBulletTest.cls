@isTest
public class OnUpdateBulletTest {
  @isTest
  public static void testSetConstructor() {
    Set<SObject> newSet = new Set<SObject>();
    OnUpdateBulletImpl bullet = new OnUpdateBulletImpl(newSet);
    System.assertEquals(newSet, bullet.exposeNewSet(), 'newSet not properly assigned');
  }

  @isTest
  public static void testSetConstructors() {
    Set<SObject> newSet = new Set<SObject>();
    Set<SObject> oldSet = new Set<SObject>();
    OnUpdateBulletImpl bullet = new OnUpdateBulletImpl(newSet, oldSet);
    System.assertEquals(newSet, bullet.exposeNewSet(), 'newSet not properly assigned');
    System.assertEquals(oldSet, bullet.exposeOldSet(), 'oldSet not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    OnUpdateBulletImpl bullet = new OnUpdateBulletImpl(newMap);
    System.assertEquals(newMap, bullet.exposeNewMap(), 'newMap not properly assigned');
  }

  @isTest
  public static void testMapConstructors() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    Map<ID, SObject> oldMap = new Map<ID, SObject>();
    OnUpdateBulletImpl bullet = new OnUpdateBulletImpl(newMap, oldMap);
    System.assertEquals(newMap, bullet.exposeNewMap(), 'newMap not properly assigned');
    System.assertEquals(oldMap, bullet.exposeOldMap(), 'oldMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    Set<SObject> newSet = new Set<SObject>();
    OnUpdateBulletImpl bullet = new OnUpdateBulletImpl(newSet);
    System.assert(
      bullet.canFire(TriggerOperation.BEFORE_UPDATE, null),
      'Can Fire on before update'
    );
    System.assert(
      bullet.canFire(TriggerOperation.AFTER_UPDATE, null),
      'Can Fire on after update'
    );
    System.assertEquals(
      false,
      bullet.canFire(TriggerOperation.AFTER_INSERT, null),
      'Cannot Fire on after insert'
    );
  }

  class OnUpdateBulletImpl extends OnUpdateBullet {
    public OnUpdateBulletImpl(Set<SObject> newSet) {
      super(newSet);
    }
    public OnUpdateBulletImpl(Set<SObject> newSet, Set<SObject> oldSet) {
      super(newSet, oldSet);
    }
    public OnUpdateBulletImpl(Map<ID, SObject> newMap) {
      super(newMap);
    }
    public OnUpdateBulletImpl(Map<ID, SObject> newMap, Map<ID, SObject> oldMap) {
      super(newMap, oldMap);
    }
    public void onBeforeFire() {
      System.debug('Test');
    }
    public void onAfterFire() {
      System.debug('Test');
    }
    public Set<SObject> exposeNewSet() {
      return newSet;
    }
    public Set<SObject> exposeOldSet() {
      return oldSet;
    }
    public Map<ID, SObject> exposeNewMap() {
      return newMap;
    }
    public Map<ID, SObject> exposeOldMap() {
      return oldMap;
    }
  }
}
