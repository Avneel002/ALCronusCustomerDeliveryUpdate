permissionset 50108 "DELIV-PREFS"
{
    Assignable = true;
    Caption = 'Delivery Preferences', MaxLength = 30;
    Permissions =
        page DeliveryPreferencesFactBox = X,
        page DeliveryPreferencesFactBox = X,
        page DeliveryPreferencesFactBoxMgt = X,
        codeunit "DeliveryPreferenceMgt." = X;
}
