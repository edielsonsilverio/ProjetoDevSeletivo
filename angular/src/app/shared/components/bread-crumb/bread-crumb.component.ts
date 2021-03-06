import { Component, OnInit, Input } from '@angular/core';


export interface BreadCrumbItem {
  text: string;
  link?: string;
}

@Component({
  selector: 'app-bread-crumb',
  templateUrl: './bread-crumb.component.html',
  styleUrls: ['./bread-crumb.component.css'],
  providers:[]
})
export class BreadCrumbComponent implements OnInit {

  @Input() items: BreadCrumbItem[] = [];
  

  constructor() { }

  ngOnInit(): void {
  }
  
  isTheLastItem(item: BreadCrumbItem): boolean {
    const index = this.items.indexOf(item);
    return (index + 1) == this.items.length;
  }
}
