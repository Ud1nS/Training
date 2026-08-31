pageextension 60149 "Item Card Extension" extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field("Negara Asal"; Rec."Negara Asal")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the country of origin for this item.';
            }
        }
    }
}