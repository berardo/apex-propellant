public abstract class OnUndeleteBullet implements OnAfterBullet {
  protected Set<SObject> newSet;
  protected Map<ID, SObject> newMap;
  
  @SuppressWarnings('PMD.EmptyStatementBlock')
  private OnUndeleteBullet() {
  }

  public OnUndeleteBullet(Set<SObject> newSet) {
    this.newSet = newSet;
  }
  public OnUndeleteBullet(Map<ID, SObject> newMap) {
    this.newMap = newMap;
  }
}
