reportextension 60148 "Purchase Order Ext" extends "Standard Purchase - Order"
{
    dataset
    {
        add("Purchase Header")
        {
            column(ProjectCode_Header; "Shortcut Dimension 1 Code")
            {
            }
        }

        add("Purchase Line")
        {
            column(NegaraAsalItem; NegaraAsalValue)
            {
            }
            column(TotalQtyOrderCol; TotalQtyOrder)
            {
            }
        }

        modify("Purchase Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                // Reset total quantity per purchase order
                TotalQtyOrder := 0;
            end;
        }

        // 4. Add trigger logic to Line
        modify("Purchase Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                Clear(NegaraAsalValue);

                // Fetch item detail safely only when line type is Item
                if ("Purchase Line".Type = "Purchase Line".Type::Item) and Item.Get("Purchase Line"."No.") then
                    NegaraAsalValue := Item."Negara Asal";

                TotalQtyOrder += "Purchase Line".Quantity;
            end;
        }
    }

    var
        Item: Record Item;
        NegaraAsalValue: Code[3];
        TotalQtyOrder: Decimal;
}