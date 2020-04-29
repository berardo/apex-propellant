@isTest
public class OnUndeleteBulletTest {
  @isTest
  public static void testSetConstructor() {
    Set<SObject> newSet = new Set<SObject>();
    OnUndeleteBulletImpl bullet = new OnUndeleteBulletImpl(newSet);
    System.assertEquals(newSet, bullet.exposeSet(), 'newSet not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    OnUndeleteBulletImpl bullet = new OnUndeleteBulletImpl(newMap);
    System.assertEquals(newMap, bullet.exposeMap(), 'newMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    Set<SObject> newSet = new Set<SObject>();
    OnUndeleteBulletImpl bullet = new OnUndeleteBulletImpl(newSet);
    System.assert(
      bullet.canFire(TriggerOperation.AFTER_UNDELETE, null),
      'Can Fire on after undelete'
    );
    System.assertEquals(
      false,
      bullet.canFire(TriggerOperation.AFTER_UPDATE, null),
      'Cannot Fire on after update'
    );
  }

  class OnUndeleteBulletImpl extends OnUndeleteBullet {
    public OnUndeleteBulletImpl(Set<SObject> newSet) {
      super(newSet);
    }
    public OnUndeleteBulletImpl(Map<ID, SObject> newMap) {
      super(newMap);
    }
    public void onBeforeFire() {
      System.debug('Test');
    }
    public void onAfterFire() {
      System.debug('Test');
    }
    public Set<SObject> exposeSet() {
      return newSet;
    }
    public Map<ID, SObject> exposeMap() {
      return newMap;
    }
  }
}
