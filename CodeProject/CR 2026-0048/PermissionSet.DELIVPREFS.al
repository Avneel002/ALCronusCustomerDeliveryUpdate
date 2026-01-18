permissionset 90109 "DELIV-PREFS"
{
    Assignable = true;
    Caption = 'Delivery Preferences';

    Permissions =
        tabledata Customer = R,
        tabledata "Sales Header" = RIMD,
        table "Sales Header" = X,
        codeunit "DeliveryPreferenceMgt." = X,
        page "DeliveryPreferencesFactBox" = X,
        page "Sales Order" = X;
}
